# given an array and a number n, where every element of the array is
# between 1 and n, and that has at least one duplicate value, return
# any of the duplicate values in less than n2 time with constant space
# array is not sorted

def find_dup(arr, max, min = 1, i = 0, j = arr.length - 1)

  p arr.slice(i, j - i + 1)
  # return if i == j
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
  count = 0
  until i == j do
    count += 1
    if arr[i] == arr[i + 1]
      # p arr
      return arr[i]
    elsif arr[i] > mid
      swap(i, j, arr)
      j -= 1
    else
      i += 1
    end
  end
  # puts count
  # recursive search
  return find_dup(arr, mid, min, prev_i, i) || find_dup(arr, max, mid + 1, i, prev_j)

end

def swap(i, j, arr)
  temp = arr[i]
  arr[i] = arr[j]
  arr[j] = temp
end


arr = [4, 3, 7, 6, 9, 2, 6, 5]
puts find_dup(arr, 9)# == 3
