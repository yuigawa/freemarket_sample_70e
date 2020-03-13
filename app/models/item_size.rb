class ItemSize < ActiveHash::Base
  self.data = [
      {id: 1, name: '10cm ✕ 10cm 以下'}, 
      {id: 2, name: '10cm ✕ 10cm 以上 〜 20cm ✕ 20cm 以下'}, 
      {id: 3, name: '20cm ✕ 20cm 以上 〜 30cm ✕ 30cm 以下'}, 
      {id: 4, name: '30cm ✕ 30cm 以上 〜 50cm ✕ 50cm 以下'}, 
      {id: 5, name: '50cm ✕ 50cm 以上 〜 1m ✕ 1m 以下'}, 
      {id: 6, name: '1m ✕ 1m 以上 〜 1.5m✕ 1.5m 以下'}, 
      {id: 7, name: '1.5m✕ 1.5m 以上 〜 2m ✕ 2m 以下'},
      {id: 8, name: '2m ✕ 2m 以上'},
  ]
end