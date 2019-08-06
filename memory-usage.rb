## VM Memory app
def memoryUsage(totalMemory, foregroundApps, backgroundApps)
  # Validate totalMemory
  return "Error: totalMemory must be an Integer." if ! totalMemory.is_a? Integer
  return "Error: totalMemory must be postitive Integer" if totalMemory < 1


  memRanking = []


  foregroundApps.each do |foreground_app|
    backgroundApps.each do |backgound_app|
      totalMemoryUsed = foreground_app[1] + backgound_app[1]
      if totalMemoryUsed > totalMemory
        next
      end
      memRanking << [[foreground_app[0], backgound_app[0]], totalMemoryUsed]
    end
  end

  memRanking.sort! {|a,b| b[1] <=> a[1]}
  # p memRanking

  optimalPair = []
  memRanking.each do |app|
    optimalPair << app[0] if app[1] == totalMemory
  end

  if optimalPair.count == 0
    optimalPair << memRanking[0][0]
  end

  if optimalPair.count == 1
    optimalPair = optimalPair[0]
  end
  
  return optimalPair
end


p memoryUsage('10', [[1,2], [2,5], [3,8]], [[1,4]])
p memoryUsage(-10, [[1,2], [2,5], [3,8]], [[1,4]])
p memoryUsage(10, [[1,2], [2,5], [3,8]], [[1,4]])
p memoryUsage(20, [[1,10], [2,15], [3,17]], [[1,3], [2,5]])


