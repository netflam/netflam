class Netflam
  module Controller
    class Tags < Netflam; end

    Tags.define do
      # not ready

      on ":name" do |name|
        # get /t/:name
        # ---------------------------------------------------------------- */
        on true do
          res.write "not ready! (" + name + ")"
        end
      end
    end
  end
end