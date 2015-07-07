namespace :import do
  task :questions => ['data/qfull', :environment] do
    Dir['data/qfull/items*.txt'].each do |filename|
      QADVItemParser.new(filename).each do |item|
        pp item
      end
    end
  end

  directory 'data/qfull' => ['data/qfull.exe']
  file 'data/qfull.exe' do
    Dir.chdir 'data' do
      `wget http://qadv.uk/qfull.exe`
    end
    Dir.chdir 'data' do
      `7z x qfull.exe`
    end
  end

  task :clean do
    rm_rf ['data/qfull.exe', 'data/qfull']
  end
end
