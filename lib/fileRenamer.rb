require "rubygems"
require 'fileutils'
require 'zip'

module FileRenamer

	path = 'path to folder with zips'

	Dir.foreach(path) do |item|
	  next if item == '.' or item == '..'

	  if item.end_with? '.zip'
	  	Zip::File.open(path + item) do |zip_file|
		  # Handle entries one by one
		  zip_file.each do |entry|
		    # Extract to file/directory/symlink
		    puts "Extracting #{entry.name}"
		    #entry.extract(dest_file)

		    fileName = item.split('_', 2).last.split('.',2).first
		    # Read into memory
		    content = entry.get_input_stream.read
	    	File.open(path+'/result/'+fileName+'.pdf',"w") do |f|
			  f.write(content)
			end

		  end

		end
	  end
	  
	end
end
