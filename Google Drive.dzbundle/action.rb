# Dropzone Action Info
# Name: Google Drive
# Description: Uploads files to Google Drive.
# Handles: Files
# Creator: Alexandru Chirițescu
# URL: http://alexchiri.com
# OptionsNIB: GoogleAuth
# AuthScope: https://www.googleapis.com/auth/drive
# Events: Dragged, Clicked
# SkipConfig: No
# RunsSandboxed: Yes
# Version: 1.7
# MinDropzoneVersion: 3.2.1
# UniqueID: 1020
# RubyPath: /System/Library/Frameworks/Ruby.framework/Versions/2.0/usr/bin/ruby

require 'gdrive'

def dragged
  gdrive = Gdrive.new

  $dz.determinate(false)

  gdrive.configure_client

  folder_id = gdrive.select_folder

  $items.each do |file|
    gdrive.upload_file(file, folder_id)
  end

  $dz.finish('File(s) were uploaded to Google Drive!')
  $dz.url(false)

end

def clicked
  system('open https://drive.google.com')
end
