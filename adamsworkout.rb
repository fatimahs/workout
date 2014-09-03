class Workout
  def initialize(id, workout_data)
    @id = id
    @date = workout_data [:date]
    @exercises = workout_data [:exercises]

  end

  def id
    @id
  end

  def date
    @date
  end

  def type
    if cardio_exercise_percentage >= 0.50
      "cardio"
    elsif strength_exercise_percentage >= 0.50
      "strength"
    else
      "other"
    end
  end

  def duration
    total = 0.0
    @exercises.each do |exercise|
      total += exercise[:duration_in_min]
    end
      total
  end

  def calories_burned
    calories = 0.0

    @exercise.each do |exercise|
      if exercise[:category] == "cardio"
        if exercise[:intensity] == "high"
          calories+= (exercise[:duration_in_min] * 10.0)
        elsif exercise[:intensity]= "medium"
          calories+= (exercise[:duration_in_min] * 8.0)
        elsif exercise[:intensity]= "low"
          calories+= (exercise[:duration_in_min] * 5.0)
        end
      else
          calories+= (exercise[:duration_in_min] * 6.0)
      end
    end
    calories
  end

def cardio_excercise_percentage
  cardio_excercise =0

  @exercise.each do |exercise|
    if exercise[:category]=="cardio"
      cardio_excercise+=1
    end
    cardio_excercise.to_f / @exercise.length
  end

def strength_exercise_percentage
     strength_excercise =0
@exercise.each do |exercise|
    if exercise[:category]=="strength"
      strength_excercise+=1
    end
     strength_excercise.to_f / @exercise.length
  end
end
#=== refactored exercise percentage=============


def excercise_percentage
  exercise_count =0

  @exercise.each do |exercise|
    if exercise[:category]=="cardio"
      exercise_count+=1
    end
    cardio_excercise.to_f / @exercise.length
  end

