update cpinfo a, ( select AppId, Sum (Amount - PlatformFee) as addRemain
    from paylog where PayTime <= ? and country = ?
    and AppId IN ( ? ) and ValidStatus = 0 and Status = 1 group by AppId ) b
set a.ActualRemain = a.ActualRemain + b.addRemain
where a.AppId = b.AppId