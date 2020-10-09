import tornado.ioloop
import tornado.web
import os


class MainHandler(tornado.web.RequestHandler):
    def get(self):
        endpoint = self.get_argument("endpoint")
        metric = self.get_argument("metric")
        step = self.get_argument("step")
        priority = self.get_argument("priority")
        time = self.get_argument("time")
        tpl_id = self.get_argument("tpl_id")
        exp_id = self.get_argument("exp_id")
        stra_id = self.get_argument("stra_id")
        tags = self.get_argument("tags")
        left_value = self.get_argument("left_value")
        note = self.get_argument("note")
        right_value = self.get_argument("right_value")
        event_id = self.get_argument("event_id")
        # dosth
        # print ("|".join((step,priority,time,tpl_id,exp_id,stra_id,tags,left_value,note,right_value,event_id)))


class manualHandler(tornado.web.RequestHandler):
    def get(self):
        endpoint = self.get_argument("endpoint")
        print("will dump %s" % (endpoint))
        os.system = ("ansible %s  -m script -a /home/wangchnchen/base.sh" % (endpoint))
        #rtcode=os.system("./dump.sh %s"%endpoint)
        self.write("done with return code %s" % rtcode)


def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
        (r'/manual', manualHandler)
    ])


if __name__ == "__main__":
    app = make_app()
    app.listen(9269)
    tornado.ioloop.IOLoop.current().start()