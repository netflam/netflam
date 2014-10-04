# PAGINATION                                                                ---
#
# Version:                           helpers/pagination.rb    0.0.1    04/10/14
# Authors:              Maciej A. Czyzewski, <maciejanthonyczyzewski@gmail.com>

class Netflam
  module Pagination
    @limit = 30
    @headers = {}

    class << self
      def page(object, number = 1)
        block = object.offset(@limit * (number.to_i - 1)).limit(@limit + 1)

        if block.count > @limit
          @headers[block.to_s] = Struct.new(:status, :number)
                                       .new(true, number.to_i)
        else
          @headers[block.to_s] = Struct.new(:status, :number)
                                       .new(false, number.to_i)
        end

        return block
      end

      def header(object, key)
        if @headers[object.to_s] != nil
          @headers[object.to_s][key]
        else
          false
        end
      end

      def prev(object)
        if Netflam::Pagination.header(object, :number) != false
          if Netflam::Pagination.header(object, :number) > 1
            return Netflam::Pagination.header(object, :number) - 1
          else
            return 0
          end
        else
          0
        end
      end

      def next(object)
        if Netflam::Pagination.header(object, :number) != false
          return Netflam::Pagination.header(object, :number) + 1
        else
          0
        end
      end
    end
  end
end