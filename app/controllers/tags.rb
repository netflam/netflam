class Netflam
  module Controller
    class Tags < Netflam; end

    Tags.define do
      # get /t/:name
      # -------------------------------------------------------------------- */
      on ":name" do |name|
        # get /t/:name?page=:page
        # ------------------------------------------------------------------ */
        on param("page", true) do |page|
          @stories = Story.joins(:tags).where(tags: {name: [name]}).recent
          @stories = Netflam::Pagination.page(@stories, page)

          render("tag")
        end

        # get /t/:name
        # ------------------------------------------------------------------ */
        on true do
          @stories = Story.joins(:tags).where(tags: {name: [name]}).recent
          @stories = Netflam::Pagination.page(@stories, 1)

          render("tag")
        end
      end
    end
  end
end