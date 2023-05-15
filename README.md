# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
Order.order_statuses_i18n.invert,{}

, [['入金待ち',0],['入金確認',1],['製作中',2],['発送準備中',3],['発送済み',4]], { include_blank: true, selected: @order.status }