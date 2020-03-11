class PostageTy < ActiveHash::Base
  self.data = [
      {id: 1, name: '未定'}, 
      {id: 2, name: 'ゆうパケット'}, 
      {id: 3, name: 'ゆうパック'}, 
      {id: 4, name: 'ヤマトネコポス'},
      {id: 5, name: 'ヤマト宅急便コンパクト'}, 
      {id: 6, name: 'ヤマト宅急便'}
  ]
end