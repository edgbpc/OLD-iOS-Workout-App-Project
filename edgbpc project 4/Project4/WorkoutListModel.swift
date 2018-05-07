
import Foundation

protocol WorkoutListModelDelegate: class {
    func dataRefreshed()
}

protocol WorkoutListModelInterface {
    weak var delegate: WorkoutListModelDelegate? { get set }
    var count: Int { get }
    func workout(atIndex index: Int) -> Workout?
    func save(workout: Workout)
    func sortByDate(ascending: Bool)
    func sortByDuration(ascending: Bool)
    func sortByCalories(ascending: Bool)
}

class WorkoutListModel: WorkoutListModelInterface {
    
    weak var delegate: WorkoutListModelDelegate?
    
    private var workouts = [Workout]()
    private let persistence: WorkoutPersistenceInterface?
    
    init() {
        self.persistence = ApplicationSession.sharedInstance.persistence
        workouts = self.persistence?.savedWorkouts ?? []
        
        sortByDuration(ascending: false)
        delegate?.dataRefreshed()
    }
    
 
    
    var count: Int {
        return workouts.count
    }
    
    func workout(atIndex index: Int) -> Workout? {
        return workouts.element(at: index)
    }
    
    func save(workout: Workout) {
        workouts.append(workout)
        persistence?.save(workout: workout)
        delegate?.dataRefreshed()
    }
    

    
    func sortByDuration(ascending: Bool){
        if ascending {
            workouts = workouts.sorted { $0.duration <= $1.duration }
        } else {
            workouts = workouts.sorted { $0.duration > $1.duration }
        }
        delegate?.dataRefreshed()
    }
    
    func sortByDate(ascending: Bool){
        if ascending {
            workouts = workouts.sorted { $0.date <= $1.date }
        } else {
            workouts = workouts.sorted { $0.date > $1.date }
            
        }
        delegate?.dataRefreshed()
    }
    
    func sortByCalories(ascending: Bool){
        if ascending {
            workouts = workouts.sorted { ($0.duration * $0.caloriesPerMinute) <= ($1.duration * $1.caloriesPerMinute) }
        } else {
            workouts = workouts.sorted { ($0.duration * $0.caloriesPerMinute) > ($1.duration * $1.caloriesPerMinute) }

            
        }
        delegate?.dataRefreshed()
    }
    
    
}



