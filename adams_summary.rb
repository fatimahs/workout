require_relative 'workout'
require 'csv'

# create a hash of workout info from CSV
def load_workout_data(filename)
  workouts = {}

  CSV.foreach(filename, headers: true, header_converters: :symbol, converters: :numeric) do |row|
    workout_id = row[:workout_id]

    if !workouts[workout_id]
      workouts[workout_id] = {
        date: row[:date],
        exercises: []
      }
    end

    exercise = {
      name: row[:exercise],
      category: row[:category],
      duration_in_min: row[:duration_in_min],
      intensity: row[:intensity]
    }

    workouts[workout_id][:exercises] << exercise
  end

  workouts
end

workouts = load_workout_data("workouts.csv")
# csv = {workout_id => workout_session}
all_workouts_data.each do |id, workout_data|
  workouts << Workout.new(id, workout_data)
end

tp(workouts, :id, :date, :type, :duration, :calories_burned)
end



