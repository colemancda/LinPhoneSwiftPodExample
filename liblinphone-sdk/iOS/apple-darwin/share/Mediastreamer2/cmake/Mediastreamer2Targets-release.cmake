#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "mediastreamer_base" for configuration "Release"
set_property(TARGET mediastreamer_base APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(mediastreamer_base PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/Frameworks/mediastreamer_base.framework/mediastreamer_base"
  IMPORTED_SONAME_RELEASE "@rpath/mediastreamer_base.framework/mediastreamer_base"
  )

list(APPEND _IMPORT_CHECK_TARGETS mediastreamer_base )
list(APPEND _IMPORT_CHECK_FILES_FOR_mediastreamer_base "${_IMPORT_PREFIX}/Frameworks/mediastreamer_base.framework/mediastreamer_base" )

# Import target "mediastreamer_voip" for configuration "Release"
set_property(TARGET mediastreamer_voip APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(mediastreamer_voip PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "mediastreamer_base;bctoolbox;ortp"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/Frameworks/mediastreamer_voip.framework/mediastreamer_voip"
  IMPORTED_SONAME_RELEASE "@rpath/mediastreamer_voip.framework/mediastreamer_voip"
  )

list(APPEND _IMPORT_CHECK_TARGETS mediastreamer_voip )
list(APPEND _IMPORT_CHECK_FILES_FOR_mediastreamer_voip "${_IMPORT_PREFIX}/Frameworks/mediastreamer_voip.framework/mediastreamer_voip" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
