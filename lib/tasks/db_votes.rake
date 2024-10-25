namespace :db do
    desc "Export the votes from sql to seeds.rb file"
    task export_votes: :environment do
      votes = Vote.all
      
      File.open(Rails.root.join('db', 'seeds.rb'), 'w') do |file|
        # Write
        file.puts "# Votes data exported on #{Time.current}"
        file.puts "# Total votes: #{votes.count}\n\n"
  
        votes.each do |vote|
          file.puts "Vote.create!("
          file.puts "  candidate_address: '#{vote.candidate_address}',"
          file.puts "  voter_address: '#{vote.voter_address}',"
          file.puts "  created_at: '#{vote.created_at}',"
          file.puts "  updated_at: '#{vote.updated_at}'"
          file.puts ")"
          file.puts
        end
      end
      
      puts "Exported #{votes.count} votes to db/seeds.rb"
    end
  end