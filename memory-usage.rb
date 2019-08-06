## VM Memory app
def memoryUsage(totalMemory, foregroundApps, backgroundApps)
  # lets validate
  # return "totalMemory must be a positive Integer." unless totalMemory.is_a? Integer && totalMemory < 1

  # get count of each app array

  # loop through larger array

  # add memory, save id's, put in result array

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


p memoryUsage(10, [[1,2], [2,5], [3,8]], [[1,4]])
p memoryUsage(20, [[1,10], [2,15], [3,17]], [[1,3], [2,5]])


