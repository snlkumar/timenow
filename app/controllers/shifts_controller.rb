class ShiftsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create,:update]
  def new
    @shift=Shift.new
    timezone = Timezone::Zone.new :latlon => [30.733315,76.77941799999999]
    puts "i am in timezone#{timezone.zone}"
  end

  def create
    Timezone::Configure.begin do |c|
      c.username = 'krishan_hiranwal123'
    end

    @shift=Shift.new(params[:shift])
    timezone = Timezone::Zone.new :latlon => [@shift.latitude,@shift.longitude]
    Time.zone=timezone.zone
    @shift.start_time=Time.now.strftime("%m-%d-%Y %H:%M")
    @shift.date=Time.now.strftime("%m/%d/%Y")
    respond_to do |format|
      if @shift.save
        format.json{
          render :json => {:valid=>"true",:id=>@shift.id}
        }
      else
        format.json{
          render :json => {:valid=>"false",:errors=>@shift.errors.count}
        }

      end
    end
  end
  
  def update
    Timezone::Configure.begin do |c|
      c.username = 'krishan_hiranwal123'
    end

    @shift=Shift.find params[:id]
    timezone = Timezone::Zone.new :latlon => [@shift.latitude,@shift.longitude]
    Time.zone=timezone.zone
    end_time=Time.now.strftime("%m-%d-%Y %H:%M")
    puts "jhkhkhk#{end_time}"
    shift_hours= Time.diff(Time.parse(end_time), Time.parse(@shift.start_time))[:diff] 
    puts "i am   #{shift_hours}" 
    respond_to do |format|
      if @shift.update_attributes(:end_time=>end_time,:shift_hours=>shift_hours)
        format.json{
          render :json => {:valid=>"true",:id=>@shift.id}
        }
      else
        format.json{
          render :json => {:valid=>"false",:errors=>@shift.errors.count}
        }

      end
    end
  end

  def index
    @shift=Shift.find params[:id]
  end

end
