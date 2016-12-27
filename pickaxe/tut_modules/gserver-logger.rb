require 'gserver'

class LogServer < GServer

    def initialize
        super(12345)
    end

    def serve(client)
        client.puts get_end_of_log_file
    end

    private

    def get_end_of_log_file
        File.open("/var/log/system.log") do |log|
            log.seek(-500, IO::SEEK_END) # 뒤에서 500 문자 백업
            log.gets                     # 완전하지 않은 행은 무시
            log.read                     # 나머지를 반환
        end
    end
end

server = LogServer.new
server.start.join

