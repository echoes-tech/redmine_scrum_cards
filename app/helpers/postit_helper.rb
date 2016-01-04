module PostitHelper
  
  def get_issue_tester(issue)
    
    tester_field = get_tester_field()
    
    if !tester_field.nil?
      
      tester_id = issue.custom_value_for(tester_field.id)
      
      if !tester_id.nil?
        return User.where(id: tester_id.to_s).first
      end

    end
    
    return nil
    
  end
  
  def get_tester_field
    
    tester_field_name = settings('tester_field_name')   
    return IssueCustomField.find_by_name(tester_field_name)
    
  end
  
  def get_date_format
    
    format = settings('date_formatter')
    return format unless format.nil? || format.empty?
    
    Rails.logger.info "[redmine_scrum_cards] No date format defined!"
    return "%d/%m/%Y"
    
  end
  
  def settings(key)   
    return Setting.plugin_redmine_scrum_cards[key] 
  end
  
end