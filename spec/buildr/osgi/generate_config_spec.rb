require File.expand_path('../../../spec_helper', __FILE__)

describe "osgi:runtime:generate-config" do
  describe "with felix container" do

    before do
      @project = define "foo" do
        project.version = "2.1.3"
        project.group = "mygroup"
        project.osgi
      end
      task('osgi:runtime:generate-config').invoke
    end

    it "generates run scripts" do
      File.should be_exist( "#{runtime_gen_dir(@project)}/run.sh")
      File.should be_exist( "#{runtime_gen_dir(@project)}/run.bat")
    end

    it "generates tmp dir" do
      File.should be_exist( "#{runtime_gen_dir(@project)}/tmp")
    end

    it "generates cache dir" do
      File.should be_exist( "#{runtime_gen_dir(@project)}/var/cache")
    end

    it "generates log dir" do
      File.should be_exist( "#{runtime_gen_dir(@project)}/var/log")
    end

    it "generates config.properties file" do
      File.should be_exist( "#{runtime_gen_dir(@project)}/configuration/config.properties")
    end

    it "generates system.properties file" do
      File.should be_exist( "#{runtime_gen_dir(@project)}/configuration/system.properties")
    end

    #raise Dir["#{@foo._("target")}/**/*"].inspect
  end
end
