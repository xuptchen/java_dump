import tornado.ioloop
import tornado.web
import os
import time
import logging
rjob={}
logging.basicConfig(filename='/tmp/test_chen/run.log',#日志存放位置
                      format='%(asctime)s - %(name)s - %(levelname)s - %(module)s - %(process)s :%(message)s',
                      datefmt='%Y-%m-%d %H:%M:%S %p',
                      level=logging.DEBUG)

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        endpoint = self.get_argument("endpoint")
        metric = self.get_argument("metric")
        step = self.get_argument("step")
        priority = self.get_argument("priority")
        time = self.get_argument("time")
        tpi_id = self.get_argument("tpi_id")
        exp_id = self.get_argument("exp_id")
        stra_id = self.get_argument("stra_id")
        tags = self.get_argument("tags")
        note = self.get_argument("note")
        right_value = self.get_argument("right_value")
        event_id = self.get_argument("event_id")


def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
    ])

if __name__ == "__main__":
    app = make_app()
    app.listen(9268)
    tornado.ioloop.IOLoop.current().start()