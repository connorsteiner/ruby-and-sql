# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert new rows in companies table
    
    new_company = Company.new
    new_company["name"] = "Apple"
    new_company["city"] = "Cupertino"
    new_company["state"] = "CA"
    new_company["url"] = "htttps://apple.com"
    #puts new_company.inspect
    new_company.save

    new_company = Company.new
    new_company["name"] = "Amazon"
    new_company["city"] = "Seattle"
    new_company["state"] = "WA"
    new_company.save

    new_company = Company.new
    new_company["name"] = "Twitter"
    new_company["city"] = "San Francisco"
    new_company["state"] = "CA"
    new_company.save

    puts "There are #{Company.all.count} companies"

# 3. query companies table to find all row with California company
    #Thing.where({"name" => "It"})
    #all_companies = Company.all
    #puts all_companies.inspect
    CA_companies = Company.where({"state" => "CA"})
    puts CA_companies.inspect
    puts "California Companies: #{CA_companies.count}"

# 4. query companies table to find single row for Apple
    # apple = Company.where({"name" => "Apple"})[0]
    # OR
    apple = Company.find_by({"name" => "Apple"})

    puts apple.inspect

# 5. read a row's column value
    apple_city = Company.find_by({"name" => "Apple"})["city"]

    puts apple_city
    #OR puts apple.city

# 6. update a row's column value
    amazon = Company.find_by({"name" => "Amazon"})
    amazon["url"] = "https://amazon.com"
    amazon.save
    puts amazon.inspect

# 7. delete a row
    twitter = Company.find_by({"name" => "Twitter"})
    twitter.destroy

    all_companies = Company.all
    puts all_companies.inspect

    puts "There are #{Company.all.count} companies."