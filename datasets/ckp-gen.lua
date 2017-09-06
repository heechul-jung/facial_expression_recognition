--
--  Copyright (c) 2016, Facebook, Inc.
--  All rights reserved.
--
--  This source code is licensed under the BSD-style license found in the
--  LICENSE file in the root directory of this source tree. An additional grant
--  of patent rights can be found in the PATENTS file in the same directory.
--
--  Script to compute list of ImageNet filenames and classes
--
--  This automatically downloads the CIFAR-10 dataset from
--  http://torch7.s3-website-us-east-1.amazonaws.com/data/cifar-10-torch.tar.gz
--

local matio = require 'matio'
local URL = 'http://torch7.s3-website-us-east-1.amazonaws.com/data/cifar-10-torch.tar.gz'

local M = {}

local function convertToTensorTrain(files)
   local data, labels

   for _, file in ipairs(files) do
      local m = matio.load(file)
      print(m)
      if not data then
         data = m.train_data
         labels = m.train_label:squeeze()

         data_geo = m.train_data2
      else
         data = torch.cat(data, m.train_data, 1)
         labels = torch.cat(labels, m.train_label:squeeze())

         data_geo = torch.cat(data, m.train_data2, 1)
      end
   end

   -- This is *very* important. The downloaded files have labels 0-9, which do
   -- not work with CrossEntropyCriterion
   labels:add(1)

   --print(data)
   --print(data)

   return {
      data = data:contiguous():view(-1, 3, 64, 64),
      labels = labels,
      data_geo = data_geo:contiguous():view(-1, 1, 1, 1176),
   }
end


local function convertToTensorTest(files)
   local data, labels

   for _, file in ipairs(files) do
      local m = matio.load(file)
      print(m)
      if not data then
         data = m.test_data
         labels = m.test_label:squeeze()

         data_geo = m.test_data2         
      else
         data = torch.cat(data, m.test_data, 1)
         labels = torch.cat(labels, m.test_data:squeeze())

         data_geo = torch.cat(data, m.test_data2, 1)         
      end
   end

   -- This is *very* important. The downloaded files have labels 0-9, which do
   -- not work with CrossEntropyCriterion
   labels:add(1)

   return {
      data = data:contiguous():view(-1, 3, 64, 64),
      labels = labels,
      data_geo = data_geo:contiguous():view(-1, 1, 1, 1176),      
   }
end

function M.exec(opt, cacheFile)
   print(" | combining dataset into a single file")
   local trainData = convertToTensorTrain({
      '/home/user/fe_db/ckp/ckp_int_10.mat',
   })
   local testData = convertToTensorTest({
      '/home/user/fe_db/ckp/ckp_int_10.mat',
   })

   print(" | saving CKP dataset to " .. cacheFile)
   torch.save(cacheFile, {
      train = trainData,
      val = testData,
   })
end

return M
