<input  class="dispatch" name="id" type="hidden" value="{{id}}">
		<section class="row  panel-info portlet-item list-group-item">
				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-university"></i> 
						<span class="attributeLeft"><span>派</span><span>遣</span><span>单</span><span>位</span></span>   
						<span>
						<select class="inputHidden form-control" id="{{detail.unitName}}" inputForm="dispatch" name="dispatchStatus" classCode='PQUNIT' />
						</span>
				</div>

				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>职</span><span>务</span><span>岗</span><span>位</span></span>   
						<span>
							<select class="inputHidden form-control" id="{{detail.workLevel}}" inputForm="dispatch" name="workLevel" classCode='WORKLEVEL' />
						</span>
				</div>
		</section>
		<section class="row  panel-info portlet-item list-group-item">
				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>面</span><span>试</span><span>日</span><span>期</span></span><br>
						<span>
							<input readonly style="width:85% " class="form-control layer-date" value="{{detail.applyDate}}" inputForm="dispatch" name="applyDate"  id="_applyDate">
                            <label class="laydate-icon inline demoicon" onclick="laydate({elem: '#_applyDate',format:'YYYY-MM-DD'});"></label>
						</span>
				</div>

				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>上</span><span>岗</span><span>日</span><span>期</span></span> <br>  
						<span>
							<input readonly style="width:85% " class="form-control layer-date" inputForm="dispatch"  value="{{detail.joinDate}}"  name="joinDate"  id="_joinDate">
                            <label class="laydate-icon inline demoicon" onclick="laydate({elem: '#_joinDate',format:'YYYY-MM-DD'});"></label>
						</span>
				</div>
		</section>
		<section class="row  panel-info portlet-item list-group-item">
				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>派</span><span>遣</span><span>状</span><span>态</span></span>   
						<!--jquery 动态加载-->
						<span><select class="inputHidden form-control" id="{{detail.dispatchStatus}}" inputForm="dispatch" name="dispatchStatus" classCode='DISPATCH_STATUS' /></span>
				</div>

				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-chrome"></i> 
						<span class="attributeLeft"><span>雇</span><span>佣</span><span>性</span><span>质</span></span>   
						<span>
						<select class="inputHidden form-control" id="{{detail.employ}}"  inputForm="dispatch" name="employ" classCode='EMPLOY' />
						</span>
				</div>
		</section>
		<section class="row  panel-info portlet-item list-group-item">

				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-university"></i> 
						<span class="attributeLeft"><span>家</span><span>港</span></span>   
						<span><input class="inputHidden form-control" inputForm="dispatch" name="jg" type="text" value="{{detail.jg}}"></span>
				</div>

				<div class="col-xs-6 ">
					<i class="fa fa-fw fa-envelope"></i> 
						<span class="attributeLeft"><span>SAP</span><span>No.</span></span>   
						<span><input class="inputHidden form-control" inputForm="dispatch" name="sapNo" type="text" value="{{detail.sapNo}}"></span>
				</div>
	</section>
		<section class="row  panel-info portlet-item list-group-item">

				<div class="col-xs-6 ">
						<input inputFormName="dispatch" class="infoSubmit btn btn-primary btn-xs" value="保 存" style="display: inline;" type="button">
						<input inputFormName="dispatch" class="infoCancel btn btn-primary btn-xs" value="取 消" style="display: inline;" type="button">
				</div>
		</section>		