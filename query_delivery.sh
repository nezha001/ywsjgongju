#!/bin/bash

while true; do
  # 提示用户输入快递号
  read -p "请输入快递号 (或输入 'exit' 退出): " tracking_number

  # 检查用户输入是否为空
  if [ -z "$tracking_number" ]; then
    echo "错误：快递号不能为空。"
    continue
  fi

  # 如果用户输入 'exit'，则退出脚本
  if [ "$tracking_number" = "exit" ]; then
    echo "退出脚本。"
    break
  fi

  # 使用curl调用API查询快递信息
  curl -s -o query_delivery.json "https://api.oioweb.cn/api/common/delivery?nu=$tracking_number" --compressed --header "Accept-Charset: UTF-8"

  # 检查curl是否成功
  if [ $? -ne 0 ]; then
    echo "错误：无法连接到快递查询API。请检查网络连接或稍后再试。"
    continue
  fi

  # 使用jq查看查询结果
  cat query_delivery.json | jq .

  # 删除查询结果文件
  rm -rf query_delivery.json
done

