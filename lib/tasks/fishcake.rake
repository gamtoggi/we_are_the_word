require 'find'

namespace :fishcake do |args|
  task :rename do

    big = "Fishcake"
    small = big.underscore
    big_2 = ENV["NAME"].classify
    small_2 = ENV["NAME"].underscore
    reg = /(#{big}|#{small})/
    
    Find.find(Rails.root) do |path|
      if File.basename(path)[0] == ?. then Find.prune
      elsif path.in? ["#{Rails.root}/tmp", "#{Rails.root}/log", __FILE__] then Find.prune
      else
        next if !FileTest.file?(path)
        next if File.extname(path).in? %w( .png .ico )

        text = File.read(path)
        next if !text.match(reg)
        
        replace = text.gsub(reg) do |match|
          case match
          when big then big_2  
          when small then small_2
          end
        end
        
        File.open(path, "w") {|file| file.puts replace}
        puts "changed #{path}..."
      end
    end
    puts "Done!"
  end
end
