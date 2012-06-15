
module CartodbTools
  class CLI < Thor
    desc "import", "Import a file into your CartoDB account"
    method_option :file, :aliases => "-f", :desc => "File to upload"
    method_option :table_name, :aliases => '-t', :desc => "Table name to create"
    method_option :geom_type, :aliases => '-g', :desc => "Geometry Type (Point, Line, Polygon, MultiPolygon)"

    def import
      raise unless File.exists? options[:file]

      CartoDB::Init.start CartodbTools::Config.config
      CartoDB::Connection.create_table options[:table_name], File.open(options[:file]), options[:geom_type]
    end

    desc "ls", "List the tables in your CartoDB account"
    method_option :all, :aliases => "-a", :desc => "Show detailed information", :default => false
    def ls
      CartoDB::Init.start CartodbTools::Config.config

      lines = []

      CartoDB::Connection.tables[:tables].each do |table|
        lines << table[:name]
        lines = lines.concat(table[:schema].map {|item| "  #{item[0]} #{item[1]}" }) if options[:all]
      end

      puts lines.join("\n")
    end

    desc "show", "Show the details of a table in your CartoDB account"
    method_option :table_name, :aliases => "-t", :desc => "Table name"
    def show
      raise unless options[:table_name]

      CartoDB::Init.start CartodbTools::Config.config

      table = CartoDB::Connection.table options[:table_name]

      lines = []
      lines << "-------------------------"
      lines << "id      : #{table[:id]}"
      lines << "name    : #{table[:name]}"
      lines << "privacy : #{table[:privacy]}"
      lines << "tags    : #{table[:tags]}"
      lines << "-------------------------"
      lines = lines.concat(table[:schema].map {|item| "#{item[0]} #{item[1]}" })

      puts lines.join("\n")
    end
  end
end
