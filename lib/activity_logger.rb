module ActivityLogger

  def add_activities(options = {})
    uesr = options[:user]
    include_person = options[:include_person]
    activity = options[:activity] ||
               Activity.create!(:item => options[:item], :user => user)
    
    users_ids = users_to_add(user, activity)
    do_feed_insert(users_ids, activity.id) unless users_ids.empty?
  end
  
  private
  
    # Return the ids of the people whose feeds need to be updated.
    # The key step is the subtraction of people who already have the activity.
    def users_to_add(user, activity)
      all = user.followers.map(&:id)
#      all.push(person.id) if include_person
      all - already_have_activity(all, activity)
    end
  
    # Return the ids of people who already have the given feed activity.
    # The results of the query are Feed objects with only a person_id
    # attribute (due to the "DISTINCT person_id" clause), which we extract
    # using map(&:person_id).
    def already_have_activity(users, activity)
      Feed.find(:all, :select => "DISTINCT user_id",
                      :conditions => ["user_id IN (?) AND activity_id = ?",
                                      users, activity]).map(&:user_id)    
    end
  
    # Return the SQL values string needed for the SQL VALUES clause.
    # Arguments: an array of ids and a common value to be inserted for each.
    # E.g., values([1, 3, 4], 17) returns "(1, 17), (3, 17), (4, 17)"
    def values(ids, common_value)
      common_values = [common_value] * ids.length
      convert_to_sql(ids.zip(common_values))
    end

    # Convert an array of values into an SQL string.
    # For example, [[1, 2], [3, 4]] becomes "(1,2), (3, 4)".
    # This does no escaping since it currently only needs to work with ints.
    def convert_to_sql(array_of_values)
      array_of_values.inspect[1...-1].gsub('[', '(').gsub(']', ')')
    end
  
    def do_feed_insert(users_ids, activity_id)
      sql = %(INSERT INTO feeds (user_id, activity_id) 
              VALUES #{values(users_ids, activity_id)})
      ActiveRecord::Base.connection.execute(sql)
    end
end