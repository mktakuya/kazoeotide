require 'shoes'

Shoes.app width: 320, height: 160, title: '数えオチド' do
  stack margin: 10 do
    @timer = banner(strong('00:00:00'))
    @count = 0
    @label = tagline '不合格レベル（全員で補講）'

    flow do
      button "start" do
        @run_flag = true
        @start = Time.now
      end
      button "stop" do
        @run_flag = false
      end
    end
  end

  animate(30) do
    if @run_flag
      @count = Time.now - @start
      @timer.replace strong(Time.at(@count).utc.strftime('%M:%S:%2N'))

      case @count
      when 0..150, 211..240
        @label.replace '不合格レベル（全員で補講）'
      when 150..160, 191..210
        @label.replace '努力レベル（補講回避）'
      when 161..170, 181..190
        @label.replace '優れている（補講回避）'
      when 171..180
        @label.replace '非常に優れている（補講回避'
      end
    end
  end
end
