# simple-quest-system

simple quest system for lua

#installation

drop the questsys into your root folder and require it. it returns the quest system table.

```lua
local questsys = require('questsys')
```

#documentation

```lua

--usage - create a new quest
--@questname - the name of the quest
--@objectives - objectives table 
--  -objectives table formatting and values:
--    {{objid = "objid1", desc = "desc1", maxvalue = maxvalue1}, 
--    {objid = "objid2", desc = "desc2", maxvalue = maxvalue2}, etc.}
--@rewards - rewards function, called when turning in completed quest
--@description (optional) - quest description
--@location (optional) - quest location
--@level (optional) - quest level
--@questgiver (optional) - name of quest giver
questsys.new(questname, objectives, rewards, description, location, level, questgiver)

--usage - increase objective value
--@questname - name of quest
--@objID - ID of the objective
--@value - the increase amount
questsys.adv_obj(questname, objID, value)

--usage - sets an objectives value 
--@questname - name of quest
--@objID - ID of the objective
--@value - the value to set the objective to
questsys.set_obj_value(questname, objID, value)

--usage - sets an objectives max value 
--@questname - name of quest
--@objID - ID of the objective
--@value - the value to set the objective to
questsys.set_obj_maxvalue(questname, objID, value)

--usage - sets theobjectives description
--@questname - name of quest
--@objID - ID of the objective
--@desc - the new description
questsys.set_obj_desc(questname, objID, desc)

--usage - returns the objectives value 
--@questname - name of quest
--@objID - ID of the objective
--returns objectives value
questsys.get_obj_value(questname, objID)

--usage - returns the objectives max value
--@questname - name of quest
--@objID - ID of the objective
--returns objectives max value
questsys.get_obj_maxvalue(questname, objID)

--usage - returns the objectives description
--@questname - name of quest
--@objID - ID of the objective
--returns objectives description
questsys.get_obj_desc(questname, objID, value)

--usage - turn in the quest
--@questname - name of the quest
--@rejectMsg - the message that is returned if you cannot turn in the quest
questsys.turnin(questname, rejectMsg)

--usage - get a quest variable
--@questname - name of the quest
--@getinfo - requested variable (can be: accepted, completed, questname, description, location, level, questgiver)
questsys.get(questname, getinfo)
```
