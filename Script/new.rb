#!/usr/bin/env ruby
require 'fileutils'
require 'json'

class Log
    def self.logStartMethod(str)
        puts ">>>>>>>>>>>>>>>>>>>>>>>>>>"
        puts str
    end
    
    def self.logInMethod(str)
        puts str
    end
    
    def self.logEndMethod()
        puts "<<<<<<<<<<<<<\n\n"
    end
end

class NewComponent

	def run()
		@path = File.expand_path(File.dirname(__FILE__))
		
        Log.logStartMethod("Start ⏳")
        Log.logEndMethod()

    	Log.logStartMethod("Information about your new component 📝")
        getInformations()

        fromDir = @path + "/template"
		toDir = @path + "/../PrismSource/Component/" + @category + "/" + @name
		
		moveFiles(fromDir, toDir)
		editFiles(toDir)

		editPodSpec()

		Log.logStartMethod("Script finished 🎉")
		Log.logInMethod("- ⚠️ If you have create a new category don’t forget to add this line : « public class "+@category+"{} » in PrismSource/Core/PrismDemo.swift")
		Log.logInMethod("- You can run: `bundle exec pod install` to see your new component in xCode")
		Log.logEndMethod()
    end

	########################
	# Pod Spec Edit
	########################
    def editPodSpec
    	Log.logStartMethod("Start updating the content of the PodSpec")

    	podSpecPath = @path + "/../OrkaPrism.podspec.json"
		podSpecJson = File.read(podSpecPath)
		podSpec = JSON.parse(podSpecJson)

		# check category 
		podCategory = JSON.parse('{
		    "name": "'+@category+'",
		    "subspecs": []
		}')

		podSpec["subspecs"].each_with_index do |value, key|
			if value["name"] == @category 
				puts "category already exist"
				podCategory = value
				podSpec["subspecs"].delete_at(key)
			end
		end


		#new lib 
		lib = [
			{
				"name": @name,
				"source_files": "PrismSource/Component/"+ @category +"/"+ @name +"/Sources/**/*.swift"
			},
			{
				"name": @name+"+Demo",
				"source_files": "PrismSource/Component/"+ @category +"/"+ @name +"/Demo/**/*.swift"
			}
		]

		podCategory["subspecs"].concat(lib)
		podSpec["subspecs"].push(podCategory)

		File.open(podSpecPath, "w") {|file| file.puts JSON.pretty_generate(podSpec) }
		Log.logEndMethod()
    end


	########################
	# Files Manages
	########################
    def editFiles (toDir)
    	Log.logStartMethod("Start updating the content of the files")
		Dir[toDir + "/**/*.*"].each do |files|
			text = File.read(files)
			new_contents = text.gsub("{{category}}", @category)
			new_contents = new_contents.gsub("{{name}}", @name)
			# To write changes to the file, use:
			File.open(files, "w") {|file| file.puts new_contents }
		end
		Log.logEndMethod()
    end

    def moveFiles (fromDir, toDir)
    	Log.logStartMethod("Start moving files")
		Dir[fromDir + "/**/*.*"].each do |files| 
			new_dest = files.gsub(fromDir, toDir)
			new_dest = new_dest.gsub("{{category}}", @category)
			new_dest = new_dest.gsub("{{name}}", @name)			
			copy_with_path(files, new_dest);
		end
		Log.logEndMethod()
    end

    def copy_with_path(src, dst)
	  FileUtils.mkdir_p(File.dirname(dst))
	  FileUtils.cp(src, dst)
	end

	########################
	# Get informations
	########################

	def getInformationsInputs(label)
    	result = requestInput(label)
    	#check KamelCase
		if result.match(/\s/)
			Log.logInMethod("⚠️  ⚠️  ⚠️  ⚠️  ⚠️  ⚠️  ⚠️")
			Log.logInMethod("🚨 Please, you can only use KamelCase")
			Log.logInMethod("⚠️  ⚠️  ⚠️  ⚠️  ⚠️  ⚠️  ⚠️")
			return getInformationsInputs(label)
		end

		return result
	end

    def getInformations
		# Get information
		@category = getInformationsInputs("What is the category of your new component? (exp: Button, ActivityLoader ...)")
    	@name = getInformationsInputs("What is the name of your new component? (exp: Buy, InputPassword ...)")
		

		#check already exist
		componentAlreadyExist = File.directory?(@path + "/../PrismSource/Component/"+@category+"/"+@name)
		if componentAlreadyExist
			Log.logInMethod("⚠️  ⚠️  ⚠️  ⚠️  ⚠️  ⚠️  ⚠️")
			Log.logInMethod("🚨 Your component, Prism" + @category +  @name + " is already exist")
			Log.logInMethod("⚠️  ⚠️  ⚠️  ⚠️  ⚠️  ⚠️  ⚠️")
			getInformations()
			return
		end

		#Generate files
    	Log.logInMethod("Your component will have this name: Prism" + @category +  @name)
    	userHasValidated = yesNo()

    	if(!userHasValidated)
    		getInformations()
    		return
    	end

    	Log.logEndMethod
    end

    def requestInput(request)
    	Log.logInMethod(request)
    	return gets.chomp
    end

	def yesNo()
		puts "Do you continue? [y/n]"
		case (gets.chomp)
		when 'y'
		  return true
		when 'n'
		  return false
		else
		  puts "I don't know what you mean."
		  return yesNo()
		end
	end
end


newComponent = NewComponent.new()
newComponent.run()