package com.wja.weixin.dao;

import org.springframework.stereotype.Repository;

import com.wja.base.common.CommRepository;
import com.wja.weixin.entity.TradeRecord;

@Repository
public interface TradeRecordDao extends CommRepository<TradeRecord, String>
{
}