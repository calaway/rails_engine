# README

This is rails engine, a sales engine api platform. The specifications of the project are [here](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rails_engine.md). It is a take-off of the [Black Thursday](https://github.com/JeanJoeris/black_thursday/blob/master/README.md) project, at Turing School of Software and Design. 


* Installation

    * Clone the project down - `git clone git@github.com:calaway/rails_engine.git`
    * Move into the cloned directory
    * Create the database and migrate it - `rake db:{create,migrate}`
    * Populate the database with data - `rake load:all`
        * If you ever want to load just one type of data you can specify, e.g. `rake load:customers`
    * Launch the server 
        * By default Rails will run off of localhost:3000
    * The api should now be working, all paths begin with `/api/v1`, see [project specification](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rails_engine.md) for full list of endpoints

* Version info
    * Ruby - 2.3.0
    * Rails - 5.0.0.1
