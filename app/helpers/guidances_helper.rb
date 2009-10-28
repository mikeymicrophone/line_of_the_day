module GuidancesHelper
  
  def acceptance_links guidance
    case guidance.status
    when 'requested'
      if current_user == guidance.coach
        link_to_remote('accept', :url => guidance_path(guidance, :guidance => {:status => 'accepted'}), :method => :put) + ' ' +
        link_to_remote('reject', :url => guidance_path(guidance, :guidance => {:status => 'rejected'}), :method => :put)
      else
        ''
      end      
    else
      ''
    end
  end
end
