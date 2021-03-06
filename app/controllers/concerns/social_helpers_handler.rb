module Concerns
  module SocialHelpersHandler
    extend ActiveSupport::Concern

    # We use this method only to make stubing easier
    # and remove FB templates from acceptance tests
    included do
      helper_method :fb_admins, :render_facebook_sdk, :render_facebook_like, :render_twitter

      before_filter do
        @fb_admins = [100000428222603, 547955110]
      end
    end

    def fb_admins
      @fb_admins
    end

    def fb_admins_add(ids)
      if ids.kind_of?(Array)
        ids.each {|id| @fb_admins << id.to_i}
      else
        @fb_admins << ids.to_i
      end
    end

    def render_facebook_sdk
      render_to_string(partial: 'layouts/facebook_sdk').html_safe
    end

    def render_twitter options={}
      render_to_string(partial: 'layouts/twitter', locals: options).html_safe
    end

    def render_facebook_like options={}
      render_to_string(partial: 'layouts/facebook_like', locals: options).html_safe
    end

  end
end
