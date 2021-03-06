module ApplicationHelper

    def nav_items
        [
            {
                url: root_path,
                title: "Home"
            },
            {
                url: about_us_path,
                title: "About Us"
            },
            {
                url: '#',
                title: "Sounds"
            }
        ]

    end

    def nav_helper(style="",tag_type="")
        nav_links = ''

        nav_items.each do |item| 
            nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
        end

        nav_links.html_safe
    end

    def active?(path)
        "active" if current_page?(path)
    end

    def login_helper(style="")
        if user_signed_in?
            (link_to "Profile", user_path(current_user),class:style) + " ".html_safe +
            (link_to "Logout",destroy_user_session_path(current_user),method: :delete,class:style) 
        else
            (link_to "SignUp",new_user_registration_path,class:style) + " ".html_safe +
                (link_to "SignWithTwitter", "/auth/twitter", class:style)
        end
    end

    def resource
        @resource || User.new
    end

    def resource_name
        :user
    end
end
