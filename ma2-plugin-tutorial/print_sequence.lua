return function() -- 回傳一個可以執行的函式給 MA，MA 會直接執行這個函式
  local seq_handle = gma.show.getobj.handle("Sequence 100") -- 會回傳一個 MA 物件 UID
  if seq_handle then
    local seq_name = gma.show.getobj.label(seq_handle)  -- 透過 UID 查詢這個物件的名稱
    gma.feedback("Sequence 100 name: " .. seq_name)
  else
    gma.feedback("Sequence 100 not found.")
  end
end