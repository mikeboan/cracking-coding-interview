# given an array and a number n, where every element of the array is
# between 1 and n, and that has at least one duplicate value, return
# any of the duplicate values in less than n2 time with constant space
# array is not sorted

def find_dup(arr, max, min = 1, i = 0, j = arr.length - 1)
  return if i == j

  if i == j - 1
    if arr[i] == arr[j]
      return arr[i]
    end
    return
  end

  # partition & search
  mid = (min + max) / 2
  prev_i = i
  prev_j = j
  until i == j do
    return arr[i] if arr[i] == arr[i + 1]
    if arr[i] > mid
      swap(i, j, arr)
      j -= 1
    else
      i += 1
    end
  end

  # recursive search
  return find_dup(arr, mid, min, prev_i, i) || find_dup(arr, max, mid + 1, i, prev_j)
end

def swap(i, j, arr)
  temp = arr[i]
  arr[i] = arr[j]
  arr[j] = temp
end


arr = [8,7,9,10,11,15,14,9]
puts find_dup(arr, arr.max)
