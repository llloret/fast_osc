require 'mkmf'

LIBDIR     = RbConfig::CONFIG['libdir']
INCLUDEDIR = RbConfig::CONFIG['includedir']

HEADER_DIRS = ["/Users/xavierriley/Projects/rtosc/include/rtosc", INCLUDEDIR]

# setup constant that is equal to that of the file path that holds that static libraries that will need to be compiled against
LIB_DIRS = [LIBDIR, File.expand_path(File.join(File.dirname(__FILE__), "lib"))]

# array of all libraries that the C extension should be compiled against
libs = ['-lrtosc']

extension_name = 'fast_osc'
dir_config(extension_name, HEADER_DIRS, LIB_DIRS)

# iterate though the libs array, and append them to the $LOCAL_LIBS array used for the makefile creation
libs.each do |lib|
  $LOCAL_LIBS << "#{lib} "
end

create_makefile(extension_name)
