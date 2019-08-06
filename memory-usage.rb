## VM Memory app
def memoryUsage(totalMemory, foregroundApps, backgroundApps)
  # Validate totalMemory
  return "Error: totalMemory must be an Integer." if ! totalMemory.is_a? Integer
  return "Error: totalMemory must be postitive Integer" if totalMemory < 1

  # Validate app arrays
  if ! foregroundApps.kind_of?(Array) || ! backgroundApps.kind_of?(Array)
    return "Error: foregroundApps and backgroundApps must be an array."
  end


  # All possible pairs
  memoryPairings = []

  # Optimal pair apps
  optimalPair = []

  # Loop through foreground and backgound app
  foregroundApps.each do |foreground_app|
    backgroundApps.each do |backgound_app|
      # add total memory used
      totalMemoryUsed = foreground_app[1] + backgound_app[1]

      # Append to memoryPairings only if totalMemoryUsed is less than or equal to totalMemory
      if totalMemoryUsed <= totalMemory
        memoryPairings << [[foreground_app[0], backgound_app[0]], totalMemoryUsed]
      end
    end
  end

  # Make sure memoryPairings has something in it
  return [] if memoryPairings.count == 0

  # Reverse sort memoryPairings
  memoryPairings.sort! {|a,b| b[1] <=> a[1]}

  # Place all app pairings into optimalPair if it equals totalMemory
  memoryPairings.each do |app|
    optimalPair << app[0] if app[1] == totalMemory
  end

  # if optimal pair doesn't equal totalMemory, just get the first one since it's reversed sorted
  if optimalPair.count == 0
    optimalPair << memoryPairings[0][0]
  end

  # Return just the pair if there's only one pairing
  if optimalPair.count == 1
    optimalPair = optimalPair[0]
  end
  
  # Done
  return optimalPair
end


# Some failed tests
p memoryUsage('10', [[1,2], [2,5], [3,8]], [[1,4]])
p memoryUsage(-10, [[1,2], [2,5], [3,8]], [[1,4]])
p memoryUsage(10, [[1,10], [2,15], [3,17]], [[1,3], [2,5]])
p memoryUsage(10, 12, [[1,4]])
p memoryUsage(10, [[1,2], [2,5], [3,8]], "String")

# Successful tests
p memoryUsage(10, [[1,2], [2,5], [3,8]], [[1,4]])
p memoryUsage(20, [[1,10], [2,15], [3,17]], [[1,3], [2,5]])