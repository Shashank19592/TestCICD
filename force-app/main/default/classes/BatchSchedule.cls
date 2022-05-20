global  class BatchSchedule implements Schedulable {
    global void execute(SchedulableContext SC) {
        CaseAssignmentBatch batchjob = new CaseAssignmentBatch();
        Database.executeBatch(batchjob);
    }
}