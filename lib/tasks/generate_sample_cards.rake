namespace :card do
  desc "Generate sample cards for development."
  task :g => :environment do
    ENV["N"].to_i.times do |i|
      Card.create(
        :user_id => 1,
        :word => "sample_#{i}",
        :mean => <<-DUMMY
          Lorem ipsum dolor sit amet, consectetuer adipiscing elit. 
          Aenean commodo ligula eget dolor. Aenean massa. Cum sociis 
          natoque penatibus et magnis dis parturient montes, nascetur 
          ridiculus mus. Donec quam felis, ultricies nec, pellentesque 
          eu, pretium quis,
        DUMMY
      )
      sleep 1
    end
  end
end
