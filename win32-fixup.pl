#! e:/program files/perl/bin/perl.exe
#  version info can be found in 'NEWS'

require "../local-paths.lib";

$package_string = "\"suil 0.10\"";
$version_string = "\"0.10.4\"";
$suil_version = "0.10.4";
$major = 0;
$minor = 10;
$micro = 4;
$binary_age = 104;
$interface_age = 0;
$current_minus_age = 0;
$gettext_package = "suil";
$exec_prefix = "lib";
#  This next one needs to go into 'local-paths.lib'
#  (and we need to accommodate a Debug version somehow)
$suil_module_folder = "\"F:/+GTK-SOURCES/gnu-win32/TestApps/Release/Mixbus3/lib/mixbus3/suil\"";

sub process_file
{
        my $outfilename = shift;
	my $infilename = $outfilename . ".in";
	
	open (INPUT, "< $infilename") || exit 1;
	open (OUTPUT, "> $outfilename") || exit 1;
	
	while (<INPUT>) {
	    s/\@VERSION@/$version_string/g;
	    s/\@PACKAGE_VERSION@/$version_string/g;
	    s/\@PACKAGE_STRING@/$package_string/g;
	    s/\@SUIL_VERSION@/$suil_version/g;
	    s/\@SUIL_API_VERSION@/$suil_api_version/g;
	    s/\@SUIL_MAJOR_VERSION\@/$major/g;
	    s/\@SUIL_MINOR_VERSION\@/$minor/g;
	    s/\@SUIL_MICRO_VERSION\@/$micro/g;
	    s/\@SUIL_INTERFACE_AGE\@/$interface_age/g;
	    s/\@SUIL_BINARY_AGE\@/$binary_age/g;
	    s/\@LIB_SUIL@/$gettext_package/g;
	    s/\@DLL_NAME\@/$gettext_package/g;
	    s/\@GETTEXT_PACKAGE\@/$gettext_package/g;
	    s/\@LT_CURRENT_MINUS_AGE@/$current_minus_age/g;
	    s/\@GlibBuildRootFolder@/$glib_build_root_folder/g;
	    s/\@PangoBuildProjectFolder@/$pango_build_project_folder/g;
	    s/\@GenericIncludeFolder@/$generic_include_folder/g;
	    s/\@GenericLibraryFolder@/$generic_library_folder/g;
	    s/\@GenericWin32LibraryFolder@/$generic_win32_library_folder/g;
	    s/\@GenericWin32BinaryFolder@/$generic_win32_binary_folder/g;
	    s/\@Debug32TestSuiteFolder@/$debug32_testsuite_folder/g;
	    s/\@Release32TestSuiteFolder@/$release32_testsuite_folder/g;
	    s/\@Debug32TargetFolder@/$debug32_target_folder/g;
	    s/\@Release32TargetFolder@/$release32_target_folder/g;
	    s/\@TargetSxSFolder@/$target_sxs_folder/g;
	    s/\@PREFIX@/$prefix/g;
	    s/\@EXEC_PREFIX@/$exec_prefix/g;
	    s/\@INCLUDEDIR@/$generic_include_folder/g;
	    s/\@LIBDIR@/$generic_library_folder/g;
	    s/\@SUIL_MODULE_DIR@/$suil_module_folder/g;
	    print OUTPUT;
	}
}

my $command=join(' ',@ARGV);

if (-1 != index($command, "-X64")) {
	$suil_api_version = "64-0";
} else {
	$suil_api_version = "32-0";
}

process_file ("suil.pc");
process_file ("build/suil_config.h");

if ($command eq -buildall) {
	process_file ("build/msvc/suil.rc");
	process_file ("build/msvc/suil.vsprops");
}