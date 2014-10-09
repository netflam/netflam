# AUTH CONTROLLER                                                           ---
#
# Version:                             controllers/auth.rb    0.0.1    04/10/14
# Authors:              Maciej A. Czyzewski, <maciejanthonyczyzewski@gmail.com>

class Netflam
  module Controller
    class Auth < Netflam; end

    Auth.define do
      on "join" do
        # get /a/join
        # ------------------------------------------------------------------ */
        on get do
          render("join", { :title => "join" })
        end

        # post /a/join (email, username, password, realname)
        # ------------------------------------------------------------------ */
        on post, param("email"), param("username"), param("password"), param("realname") do |email, username, password, realname|
          user = User.new
          user.email = email
          user.username = username
          user.password = password
          user.realname = realname

          if user.valid? == false
            @errors = user.errors.messages
            render("join", { :title => "join" })
          else
            user.save
            res.redirect "/a/login/ready"
          end
        end
      end

      on "login" do
        # get /a/login/ready
        # ------------------------------------------------------------------ */
        on "ready" do
          @success = { you: ["have been successfully registered"] }
          render("login", { :title => "login" })
        end

        # post /a/login (email, password)
        # ------------------------------------------------------------------ */
        on post, param("email"), param("password") do |email, password|
          user = User.find_by_email(email)

          unless user.nil? || user == 0
            if user.authenticate(password)
              session[:auth] = true
              session[:user] = user
              res.redirect "/"
            else
              @errors = { password: ["is incorrect"] }
              render("login", { :title => "login" })
            end
          else
            @errors = { email: ["is incorrect"] }
            render("login", { :title => "login" })
          end
        end

        # get /a/login
        # ------------------------------------------------------------------ */
        on true do
          render("login", { :title => "login" })
        end
      end

      # get /a/logout
      # -------------------------------------------------------------------- */
      on "logout" do
        session.clear
        res.redirect "/"
      end
    end
  end
end
