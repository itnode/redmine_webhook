module RedmineWebhook
  module ProjectsHelperPatch
    def project_settings_tabs
      tabs = super
      webhook_tab = {
        :name => 'webhook',
        :controller => 'webhook_settings',
        :action => :show,
        :partial => 'webhook_settings/show',
        :label => :webhook
      }
      tabs << webhook_tab if User.current.allowed_to?(:manage_hook, @project)
      tabs
    end
  end
end

# Use prepend for Redmine 5.x/6.x compatibility
ProjectsHelper.prepend(RedmineWebhook::ProjectsHelperPatch)
