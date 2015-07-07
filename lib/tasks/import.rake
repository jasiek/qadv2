namespace :import do
  task :questions => ['data/qfull']
  directory 'data/qfull' => ['data/qfull.exe']
  file 'data/qfull.exe' => [:fetch, :decompress]

  task :fetch do
    Dir.chdir 'data' do
      `wget http://qadv.uk/qfull.exe`
    end
  end

  task :decompress do
    Dir.chdir 'data' do
      `7z x qfull.exe`
    end
  end

  task :clean do
    rm_rf ['data/qfull.exe', 'data/qfull']
  end
end
