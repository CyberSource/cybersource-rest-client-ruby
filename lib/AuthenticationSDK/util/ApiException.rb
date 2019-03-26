public
  class ApiException
    def apiexception(err,log_Obj)
      log_Obj.logger.error(err.message)
      if !err.backtrace.to_s.empty?
        log_Obj.logger.error(err.backtrace)
      end
      log_Obj.logger.info('END> =======================================')
      puts 'Check log for more details.'
    end
    def apiwarning(message,log_Obj)
      log_Obj.logger.warn(message)
    end
    def customerror(message,log_Obj)
      log_Obj.logger.error(message)
      log_Obj.logger.info('END> =======================================')
      puts 'Check log for more details.'
    end
  end