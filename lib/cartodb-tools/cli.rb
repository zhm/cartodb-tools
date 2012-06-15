
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
  end
end
