public
    class ExceptionHandler
        @exception_message

        def new_api_exception(err)
            @exception_message = err.message

            if !err.backtrace.to_s.empty?
                @exception_message += "\n" + err.backtrace
            end

            @exception_message += '\nEND> ======================================='
            return @exception_message
        end

        def new_api_warning(msg)
            @exception_message = msg
            return @exception_message
        end

        def new_custom_error(msg)
            @exception_message = msg
            @exception_message += '\nEND> ======================================='
            return @exception_message
        end
    end