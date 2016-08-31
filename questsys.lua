
local questsys = {}
questsys.quest = {}

function questsys.new(questname, objectives, reward, description, location, level, questgiver)
  local description = description or ""; local location = location or ""; local level = level or ""; local questgiver = questgiver or ""
  assert(questname, "Must include quest name!"); assert(type(questname) == "string", "Quest name must be a string, was: " .. type(questname))
  assert(objectives, "Must include objectives!"); assert(type(objectives) == "table", "Objectives must be a table, was: " .. type(objectives))
  assert(reward, "Must include rewards!"); assert(type(reward) == "function", "Reward must be a functiom, was: " .. type(reward))
  for k, v in ipairs(objectives) do
    assert(v.id, "Objectives must have an id!")
    assert(v.maxvalue, "Objectives must have a max value!")
    assert(v.desc, "Objectives must have a description!")
    v.value = 0
  end
  questsys.quest[#questsys.quest+1] = {
    questname = questname,
    objectives = objectives,
    reward = reward,
    description = description,
    location = location,
    level = level,
    questgiver = questgiver,
    accepted = false,
    completed = false,
    isAccepted = function(self) return self.accepted end,
    isCompleted = function(self) return self.completed end
  }
end

function questsys.adv_obj(questname, objID, value)
  for k, v in ipairs(questsys.quest) do
    if v.questname == questname then
      for _, r in ipairs(questsys.quest[k].objectives) do
        if r.id == objID then
          assert(r.value + value <= r.maxvalue, "Objective value cannot exceed its max value")
          r.value = r.value + value
        else error("No such objective id") end
      end
    else error("No such quest name!") end
  end
end

function questsys.set_obj_value(questname, objID, value)
  assert(value, "Must supply value!")
  for k, v in ipairs(questsys.quest) do
    if v.questname == questname then
      for _, r in ipairs(questsys.quest[k].objectives) do
        if r.id == objID then
          local value = value or r.value
          r.value = value
        else error("No such objective id!") end
      end
    else error("No such quest name!") end
  end
end

function questsys.set_obj_maxvalue(questname, objID, value)
  assert(value, "Must supply value!")
  for k, v in ipairs(questsys.quest) do
    if v.questname == questname then
      for _, r in ipairs(questsys.quest[k].objectives) do
        if r.id == objID then
          local value = value or r.maxvalue
          r.maxvalue = value
        else error("No such objective id!") end
      end
    else error("No such quest name!") end
  end
end

function questsys.set_obj_desc(questname, objID, desc)
  assert(desc, "Must supply desc!")
  for k, v in ipairs(questsys.quest) do
    if v.questname == questname then
      for _, r in ipairs(questsys.quest[k].objectives) do
        if r.id == objID then
          local desc = desc or r.desc
          r.desc = desc
        else error("No such objective id!") end
      end
    else error("No such quest name!") end
  end
end

function questsys.get_obj_value(questname, objID)
  assert(value, "Must supply value!")
  for k, v in ipairs(questsys.quest) do
    if v.questname == questname then
      for _, r in ipairs(questsys.quest[k].objectives) do
        if r.id == objID then
          local value = value or r.value
          return r.value
        else error("No such objective id!") end
      end
    else error("No such quest name!") end
  end
end

function questsys.get_obj_maxvalue(questname, objID)
  assert(value, "Must supply value!")
  for k, v in ipairs(questsys.quest) do
    if v.questname == questname then
      for _, r in ipairs(questsys.quest[k].objectives) do
        if r.id == objID then
          local value = value or r.maxvalue
          return r.maxvalue
        else error("No such objective id!") end
      end
    else error("No such quest name!") end
  end
end

function questsys.get_obj_desc(questname, objID)
  assert(value, "Must supply value!")
  for k, v in ipairs(questsys.quest) do
    if v.questname == questname then
      for _, r in ipairs(questsys.quest[k].objectives) do
        if r.id == objID then
          local desc = desc or r.desc
          return r.desc
        else error("No such objective id!") end
      end
    else error("No such quest name!") end
  end
end

function questsys.turnin(questname, rejectMsg)
  local rejectMsg = rejectMsg or "You cannot turn in this quest because you have not completed it."
  for k, v in ipairs(questsys.quest) do
    if v.questname == questname then
      for _, r in ipairs(questsys.quest[k].objectives) do
        if r.value == r.maxValue then
          v.reward()
        else return rejectMsg end
      end
    else error("No such quest name!") end
  end
end

function questsys.get(questname, getinfo)
  for k, v in ipairs(questsys.quest) do
    if v.questname == questname then
      if getinfo == "accepted" then return v:isAccepted() end
      if getinfo == "completed" then return v:isCompleted() end
      if getinfo == "questname" then return v.questname end
      if getInfo == "description" then return v.description end
      if getInfo == "location" then return v.location end
      if getInfo == "level" then return v.level end
      if getInfo == "questgiver" then return v.questgiver end
    else error("No such quest name!")
  end
end

return questsys
