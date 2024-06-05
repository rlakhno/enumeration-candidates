# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

# def find(id)
#     # Your code Here
#   end

def find(id, candidates)
    candidates.find { |candidate| candidate[:id] == id }
  end
  
def experienced?(candidate)
    candidate[:years_of_experience] >= 2
end
  
def qualified_candidates(candidates)
    experienced_candidates = candidates.select { |candidate| experienced?(candidate) }
    github_points_candidates = experienced_candidates.select { |candidate| candidate[:github_points] >= 100 }
    ruby_or_python_candidates = github_points_candidates.select { |candidate| candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python') }
    recent_applicants = ruby_or_python_candidates.select { |candidate| (Date.today - candidate[:date_applied]).to_i <= 15 }
    adult_candidates = recent_applicants.select { |candidate| candidate[:age] > 17 }
  
    adult_candidates
end
  
def ordered_by_qualifications(candidates)
    candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
end
  