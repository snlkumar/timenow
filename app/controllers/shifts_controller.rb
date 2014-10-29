class ShiftsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create,:update]
  def new
    Timezone::Configure.begin do |c|
      c.username = 'krishan_hiranwal123'
    end
    @shift=Shift.new
    Timezone::Configure.begin do |c|
      c.username = 'krishan_hiranwal123'
    end
    timezone = Timezone::Zone.new :latlon => [30.733315,76.77941799999999]
    puts "i am in timezone#{timezone.zone}"
  end

  def create
    Timezone::Configure.begin do |c|
      c.username = 'krishan_hiranwal123'
    end

    @shift=Shift.new(params[:shift])
    # timezone = Timezone::Zone.new :latlon => [@shift.latitude,@shift.longitude]
    # Time.zone=timezone.zone
    @shift.start_time=Time.now.strftime("%d-%m-%Y %H:%M")
    @shift.date=Time.now.strftime("%d/%m/%Y")
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
    # timezone = Timezone::Zone.new :latlon => [@shift.latitude,@shift.longitude]
    # Time.zone=timezone.zone
    start_time = @shift.start_time
    puts "the start time is #{start_time}"
    end_time=Time.now.strftime("%d-%m-%Y %H:%M")
    puts "jhkhkhk#{end_time}"
    shift_hours= Time.diff(Time.parse(end_time), Time.parse(start_time))[:diff] 
    puts "i am   #{shift_hours}"
    puts "shift hours in integer#{Time.parse(shift_hours)}" 
    respond_to do |format|
      if @shift.update_attributes(:end_time=>end_time,:shift_hours=>shift_hours,:status=>"checked_out")
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
